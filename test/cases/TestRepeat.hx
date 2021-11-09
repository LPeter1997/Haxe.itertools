package cases;

import itertools.Basic;
import utest.Assert;
using itertools.Extensions;

class TestRepeat extends Test {
    public function new() {}

    function testRepeated() {
        var r = Basic.repeat(7).iterator();
        Assert.isTrue(r.next() == 7);
        Assert.isTrue(r.next() == 7);
        Assert.isTrue(r.next() == 7);
        Assert.isTrue(r.next() == 7);
    }
}
