echo "echo Restoring environment" > "/Users/jordanta/conantest/test_package/build/Release/generators/deactivate_conanrunenv-release-armv8.sh"
for v in LD_LIBRARY_PATH DYLD_LIBRARY_PATH
do
    is_defined="true"
    value=$(printenv $v) || is_defined="" || true
    if [ -n "$value" ] || [ -n "$is_defined" ]
    then
        echo export "$v='$value'" >> "/Users/jordanta/conantest/test_package/build/Release/generators/deactivate_conanrunenv-release-armv8.sh"
    else
        echo unset $v >> "/Users/jordanta/conantest/test_package/build/Release/generators/deactivate_conanrunenv-release-armv8.sh"
    fi
done


export LD_LIBRARY_PATH="/Users/jordanta/.conan/data/test/1.0/test/1.0/package/c6a7b978c36bfbdf05646cef650d3b8d3c8bea46/lib:$LD_LIBRARY_PATH"
export DYLD_LIBRARY_PATH="/Users/jordanta/.conan/data/test/1.0/test/1.0/package/c6a7b978c36bfbdf05646cef650d3b8d3c8bea46/lib:$DYLD_LIBRARY_PATH"