module.exports = (grunt) ->
  conf =
    copy:
      main:
        files: [ {
          expand: true
          src: ['assets/**']
          dest: 'public/'
        },
        {
          src: ['CNAME']
          dest: 'public/'
        }]
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
          'src/**',
          'assets/**'
        ],
        tasks: [
          'recess:dist',
          'htmlmin:dist',
          'copy:main'
        ],
        options:
          livereload: true
    git_deploy:
      main:
        options:
          url: 'git@github.com:soscet/soscet.github.io',
          branch: 'master',
          message: 'Update'
        src: 'public'

  grunt.loadNpmTasks 'grunt-recess'
  grunt.loadNpmTasks 'grunt-git-deploy'
  grunt.loadNpmTasks 'grunt-contrib-htmlmin'
  grunt.loadNpmTasks 'grunt-contrib-copy'
  grunt.loadNpmTasks 'grunt-contrib-watch'

  grunt.initConfig conf

  grunt.registerTask 'default', ['recess', 'htmlmin', 'copy']
  grunt.registerTask 'w', ['watch']
  grunt.registerTask 'deploy', ['git_deploy']

