module.exports = function(grunt) {
	grunt.initConfig({
		babel: {
			options: {
				sourceMap: true,
				presets: ['env']
			},
			dist: {
				files: [{
					 expand: true,
					 cwd: 'source/js',
					 src: ['**/*.js'],
					 dest: 'target/js',
					 ext:'.js'
				 }]
			}
		}
	});

	grunt.loadNpmTasks('grunt-babel');
	grunt.registerTask('default', ['babel']);
};
