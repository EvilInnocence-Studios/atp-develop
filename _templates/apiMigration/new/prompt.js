const { readdirSync, existsSync } = require('fs');
const { resolve } = require('path');

module.exports = {
  prompt: ({ inquirer, args }) => {
    const questions = [];
    if (!args.module) questions.push({ type: 'input', name: 'module', message: 'What is the module name? (e.g. comic)' });
    if (!args.migrationName) questions.push({ type: 'input', name: 'migrationName', message: 'What is the migration name? (e.g. addAuthorField)' });
    
    return inquirer.prompt(questions).then(answers => {
      const merged = { ...args, ...answers };
      const migrationsPath = resolve(__dirname, `../../../api/src/${merged.module}/migrations`);
      let sequence = '00';
      if (existsSync(migrationsPath)) {
        const files = readdirSync(migrationsPath).filter(f => f.endsWith('.ts') || f.endsWith('.js'));
        let maxSeq = -1;
        for (const file of files) {
          const match = file.match(/^(\d+)-/);
          if (match) {
            const seq = parseInt(match[1], 10);
            if (seq > maxSeq) maxSeq = seq;
          }
        }
        sequence = (maxSeq + 1).toString().padStart(2, '0');
      }
      return { ...merged, sequence };
    });
  }
};
