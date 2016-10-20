

set(python_coverage_dir ${CMAKE_CURRENT_SOURCE_DIR}/python-coverage)
set(python_coverage_source ${python_module_dir}/director)
set(python_coverage_data_dir ${CMAKE_BINARY_DIR}/python-coverage)
set(python_coverage_conf_file ${python_coverage_data_dir}/coverage.conf)
set(python_coverage_html_dir ${python_coverage_data_dir}/html)

configure_file(${python_coverage_dir}/coverage.conf.in ${python_coverage_conf_file} @ONLY)

set(python_coverage_environment_arg COVERAGE_PROCESS_START=${python_coverage_conf_file})

add_custom_target(python-coverage
  COMMAND ${CMAKE_COMMAND} -E remove_directory ${python_coverage_html_dir}
  COMMAND env ${python_coverage_environment_arg} ${PYTHON_EXECUTABLE} ${python_coverage_dir}/report_html.py
  COMMENT "generating python coverage html")
