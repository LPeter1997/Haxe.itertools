package cases;

import utest.Assert;
using itertools.Extensions;

class TestReverse extends Test {
    public function new() {}

    function testEmpty() {
        var i = [].asIterable().reverse().iterator();
        Assert.isFalse(i.hasNext());
    }

    function testSingle() {
        var i = [1].asIterable().reverse().iterator();
        Assert.isTrue(i.hasNext());
        Assert.isTrue(i.next() == 1);
        Assert.isFalse(i.hasNext());
    }

    function testMany() {
        var i = [1, 2, 3].asIterable().reverse().iterator();
        Assert.isTrue(i.hasNext());
        Assert.isTrue(i.next() == 3);
        Assert.isTrue(i.hasNext());
        Assert.isTrue(i.next() == 2);
        Assert.isTrue(i.hasNext());
        Assert.isTrue(i.next() == 1);
        Assert.isFalse(i.hasNext());
    }
}
