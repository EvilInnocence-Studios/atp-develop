module.exports = {
  prompt: ({ inquirer }) => {
    const questions = [
      {
        type: 'input',
        name: 'name',
        message: 'Module name?'
      }
    ]
    return inquirer
      .prompt(questions)
  }
}
