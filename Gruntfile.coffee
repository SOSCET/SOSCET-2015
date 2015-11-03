exec = require('child_process').exec

module.exports = (grunt) ->
  conf =
    copy:
      main:
        files: [ {
          expand: true
          src: ['assets/**']
          dest: 'public/'
        } ]
    recess:
      dist:
        options:
          compile: true
          compress: true
        files:
          'public/assets/stylesheets/main.css':'src/less/custom.less'
    htmlmin:
      dist:
        options:
          removeComments: true
          collapseWhitespace: true
        files:
          'public/index.html':'src/index.html'

  grunt.loadNpmTasks 'grunt-recess'
  grunt.loadNpmTasks 'grunt-contrib-htmlmin'
  grunt.loadNpmTasks 'grunt-contrib-copy'

  grunt.initConfig conf

  grunt.registerTask 'default', ['recess', 'htmlmin', 'copy']
  grunt.registerTask 'deploy', 'Deploy it to master branch.', ->
    exec 'sh ./deploy.sh', (err, stdout, stderr) -> 
      if err
        throw new Error err
