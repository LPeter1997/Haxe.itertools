package cases;

import utest.Assert;
using itertools.Extensions;

class TestFlatMap extends Test {
    public function new() {}

    function testEmpty() {
        var r = [].flatMap(x -> [x, 2 * x, 3 * x]).iterator();
        Assert.isFalse(r.hasNext());
    }

    function testNotEmpty() {
        var r = [1, 2, 3].flatMap(x -> [x, 2 * x]).iterator();
        Assert.isTrue(r.hasNext());
        Assert.isTrue(r.next() == 1);
        Assert.isTrue(r.hasNext());
        Assert.isTrue(r.next() == 2);
        Assert.isTrue(r.hasNext());
        Assert.isTrue(r.next() == 2);
        Assert.isTrue(r.hasNext());
        Assert.isTrue(r.next() == 4);
        Assert.isTrue(r.hasNext());
        Assert.isTrue(r.next() == 3);
        Assert.isTrue(r.hasNext());
        Assert.isTrue(r.next() == 6);
        Assert.isFalse(r.hasNext());
    }
}
