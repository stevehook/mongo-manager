watch('public/coffee') {|file_name| system 'rake js:compile' }
watch('spec/coffee') {|file_name| system 'rake js:compile_specs' }
