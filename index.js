#!/usr/bin/env node
const { exec } = require('child_process');
const https = require('https');
const fs = require('fs');

// Access the command-line arguments
const args = process.argv.slice(2);

// Check if an argument is provided
if (args.length === 0) {
  console.error('No argument provided.');
}

// Get the value of the argument
const PAT = args[0];

// Download the shell script
const scriptUrl = 'https://raw.githubusercontent.com/hmredmond/docker-cookiecutter/main/bin/kickoff.sh';
const scriptPath = './kickoff.sh';

https.get(scriptUrl, (response) => {
  if (response.statusCode !== 200) {
    console.error(`Failed to download the script. Status code: ${response.statusCode}`);
    return;
  }

  const fileStream = fs.createWriteStream(scriptPath);
  response.pipe(fileStream);

  fileStream.on('finish', () => {
    fileStream.close();

    // Make the script executable
    fs.chmodSync(scriptPath, '755');
  });
}).on('error', (error) => {
  console.error(`Error downloading the script: ${error.message}`);
});