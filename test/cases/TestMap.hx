package cases;

import utest.Assert;
using itertools.Extensions;

class TestMap extends Test {
    public function new() {}

    function testDouble() {
        var r = [1, 2, 3].asIterable().map(x -> x * 2).iterator();
        Assert.isTrue(r.next() == 2);
        Assert.isTrue(r.next() == 4);
        Assert.isTrue(r.next() == 6);
        Assert.isFalse(r.hasNext());
    }
}
