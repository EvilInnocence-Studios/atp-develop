module.exports = {
  prompt: ({ inquirer, args }) => {
    const questions = [];
    if (!args.module) questions.push({ type: 'input', name: 'module', message: 'What is the module name? (e.g. comic)' });
    if (!args.entity) questions.push({ type: 'input', name: 'entity', message: 'What is the entity name? (e.g. arc)' });
    return inquirer.prompt(questions).then(answers => ({ ...args, ...answers }));
  }
}
