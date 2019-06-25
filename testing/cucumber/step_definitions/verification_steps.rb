Then(/^a linting report will be made for all features$/) do
  expect(@output).to match(/\d+ issues found/)
end

Then(/^the resulting output is the following:$/) do |text|
  text.gsub!('<path_to>', @root_test_directory)

  expect(@results.strip).to eq(text)
end

Then(/^the resulting output will include the following:$/) do |text|
  text.gsub!('<path_to>', @root_test_directory)

  expect(@results.chomp).to include(text)
end

Then(/^an error is reported$/) do |table|
  table.hashes.each do |error_record|
    expect(@results).to include({ linter:   error_record['linter'],
                                  problem:  error_record['problem'],
                                  location: error_record['location'].sub('<path_to_file>', @model.get_ancestor(:feature_file).path).sub('<model_line_number>', @model.source_line.to_s) })
  end
end

Then(/^the following linters are registered(?: by default)?$/) do |linter_names|
  expect(CukeLinter.registered_linters.keys).to match_array(linter_names.raw.flatten)
end

Then(/^no error is reported$/) do
  expect(@results).to be_empty
end

Then(/^the linter "([^"]*)" is no longer registered$/) do |linter_name|
  expect(CukeLinter.registered_linters).to_not have_key(linter_name)
end

Then(/^the following help is displayed:$/) do |text|
  expect(@output.chomp).to eq(text)
end

Then(/^the version of the tool is displayed:$/) do |text|
  major_number, minor_number, patch_number = CukeLinter::VERSION.split('.')
  text.sub!('<major>', major_number)
  text.sub!('<minor>', minor_number)
  text.sub!('<patch>', patch_number)

  expect(@output.chomp).to eq(text)
end

Then(/^the linting report will be output to "([^"]*)"$/) do |file_path|
  file_path.gsub!('<path_to>', @root_test_directory)

  expect(File.read(file_path)).to match(/\d+ issues found/)
end

And(/^the file "([^"]*)" contains:$/) do |file_path, text|
  file_path.gsub!('<path_to>', @root_test_directory)

  expect(File.read(file_path)).to eq(text)
end
