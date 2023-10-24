#!/usr/bin/env fish

set -l FAILED 0

echo -n "📝 fisher: "
# Test if fisher is installed and print version if it is

if type fisher > /dev/null 2>&1
set -l fisher_version (fisher -v  | awk '{print $NF}')
    echo "✅ Succesfully installed (version: $fisher_version)"
else
    echo -e "❌ Not Installed"
    set FAILED 1
end

exit $FAILED