// see types of prompts:
// https://github.com/enquirer/enquirer/tree/master/examples
//

const { readdirSync, statSync } = require("fs");
const { resolve } = require("path");

const modules = readdirSync(resolve(__dirname, '../../../../admin/src')).filter((file) => {
    return statSync(resolve(__dirname, '../../../../admin/src', file)).isDirectory() && !file.includes("-shared");
  });

module.exports = [
    {
      message: "Project",
      name: 'project',
      type: 'select',
      choices: ['admin', 'public'],
    },
    {
      message: "Module",
      name: 'module',
      type: 'select',
      choices: modules,
    },
    {
      message: "Component Name",
      name: 'componentName',
      type: 'input',
    },
    {
      message: "Category",
      name: 'category',
      type: 'input',
    },
    {
      message: "Sub-Category",
      name: 'subCategory',
      type: 'input',
    },
    {
      message: "Include prop editor?",
      name: 'hasPropEditor',
      type: 'confirm',
      initial: false
    },
    {
      message: "Include layout editor?",
      name: 'hasLayoutEditor',
      type: 'confirm',
      initial: false
    }
  ];
