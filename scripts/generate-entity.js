const { prompt } = require('enquirer');
const { execSync } = require('child_process');
const fs = require('fs');
const path = require('path');

const getDirectories = source =>
  fs.existsSync(source) ? fs.readdirSync(source, { withFileTypes: true })
    .filter(dirent => dirent.isDirectory() && !dirent.name.endsWith('-shared'))
    .map(dirent => dirent.name) : [];

async function run() {
    try {
        const adminSrc = path.resolve(__dirname, '../../admin/src');
        const apiSrc = path.resolve(__dirname, '../../api/src');
        
        const adminModules = getDirectories(adminSrc);
        const apiModules = getDirectories(apiSrc);
        const allModules = [...new Set([...adminModules, ...apiModules])].sort();

        const answers = await prompt([
            {
                type: 'autocomplete',
                name: 'module',
                message: 'What is the module name?',
                choices: allModules
            },
            {
                type: 'input',
                name: 'entity',
                message: 'What is the entity name? (e.g. arc)'
            }
        ]);

        const { module: modName, entity } = answers;
        const migrationName = `create${entity.charAt(0).toUpperCase() + entity.slice(1)}Table`;

        console.log(`\nGenerating API Entity...`);
        execSync(`npx hygen apiEntity new --module ${modName} --entity ${entity}`, { stdio: 'inherit' });

        console.log(`\nGenerating Shared Types...`);
        execSync(`npx hygen sharedType new --module ${modName} --entity ${entity}`, { stdio: 'inherit' });

        console.log(`\nGenerating UI Service...`);
        execSync(`npx hygen uiService new --module ${modName} --entity ${entity}`, { stdio: 'inherit' });

        console.log(`\nGenerating Initial Migration...`);
        execSync(`npx hygen apiMigration new --module ${modName} --entity ${entity} --migrationName ${migrationName}`, { stdio: 'inherit' });

        console.log(`\nAll generators complete!`);
    } catch (e) {
        console.error(e);
        process.exit(1);
    }
}

run();
