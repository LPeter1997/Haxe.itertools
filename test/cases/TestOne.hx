package cases;

import itertools.Basic;
import utest.Assert;
using itertools.Extensions;

class TestOne extends Test {
    public function new() {}

    function testOne() {
        var it = Basic.one(1).iterator();
        Assert.isTrue(it.hasNext());
        Assert.isTrue(it.next() == 1);
        Assert.isFalse(it.hasNext());
    }
}
