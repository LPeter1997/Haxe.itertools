package cases;

import itertools.Basic;
import utest.Assert;
using itertools.Extensions;

class TestEmpty extends Test {
    public function new() {}

    function testEmpty() {
        var it = Basic.empty().iterator();
        Assert.isFalse(it.hasNext());
    }
}
