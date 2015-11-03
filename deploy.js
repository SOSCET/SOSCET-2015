#!/bin/env node
var fs      = require('fs');
var exec    = require('child_process').exec;
var repoURL = 'git@github:SOSCET/SOSCET.github.io';
fs.exists('public', function(isExists) {
    if(isExists)
        process.chdir('public');
    else
        throw "./public doesn't exists";
})

exec(`cd public && git init && git add -A && git commit -m "Update" && git remote add origin ${repoURL} && git push ${repoURL}`, function(err, stdout, stderr) {
    if(err)
        throw err;
    console.log(stdout)
});
