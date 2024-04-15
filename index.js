#!/usr/bin/env node
const { exec } = require('child_process');

// inspired by https://github.com/piuccio/cowsay

// Access the command-line arguments
const args = process.argv.slice(2);

// Check if an argument is provided
if (args.length === 0) {
  console.error('No argument provided.');
  process.exit(1);
}

// Get the value of the argument
const myArgument = args[0];

// Use the argument in your script
console.log(`Argument value: ${myArgument}`);

// Execute the shell script
exec(`sh ./kickoff-time.sh ${myArgument}`, (error, stdout, stderr) => {
  if (error) {
    console.error(`Error executing the script: ${error.message}`);
    return;
  }
  if (stderr) {
    console.error(`Script execution returned an error: ${stderr}`);
    return;
  }
  console.log(`Build Script executed successfully. Output:\n${stdout}`);

    exec(`sh ./kickoff-time-run.sh`, (error, stdout, stderr) => {
    if (error) {
        console.error(`Error executing the script: ${error.message}`);
        return;
    }
    if (stderr) {
        console.error(`Script execution returned an error: ${stderr}`);
        return;
    }
    console.log(`Run Script executed successfully. Output:\n${stdout}`);
    });
  
});