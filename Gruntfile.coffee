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
          'public/index.html': 'src/index.html'
    watch:
      main:
        files: [
          'src/index.html',
          'assets/**'
        ],
        tasks: [
          'recess:dist',
          'htmlmin:dist',
          'copy:main'
        ],
        options:
          livereload: true

  grunt.loadNpmTasks 'grunt-recess'
  grunt.loadNpmTasks 'grunt-contrib-htmlmin'
  grunt.loadNpmTasks 'grunt-contrib-copy'
  grunt.loadNpmTasks 'grunt-contrib-watch'

  grunt.initConfig conf

  grunt.registerTask 'default', ['recess', 'htmlmin', 'copy']
  grunt.registerTask 'w', ['watch']

