#!/usr/bin/env fish

echo "Testing fish shell installation..."

set -l FAILED 0

# Test if fisher is installed and print version if it is
set -l fisher_version (fisher -v | awk '{print $NF}')
echo -n "📝 fisher: "
if test $status -eq 0
    echo "✅ Succesfully installed (version: $fisher_version)"
else
    echo -e "❌ Not Installed"
    set FAILED 1
end

exit $FAILED