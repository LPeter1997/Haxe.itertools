package cases;

import itertools.Iterators;
import utest.Assert;
using itertools.Extensions;

class TestRepeat extends Test {
    public function new() {}

    function testRepeated() {
        var r = Iterators.repeat(7);
        Assert.isTrue(r.next() == 7);
        Assert.isTrue(r.next() == 7);
        Assert.isTrue(r.next() == 7);
        Assert.isTrue(r.next() == 7);
    }
}
