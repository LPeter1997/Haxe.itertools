package cases;

import utest.Assert;
using itertools.Extensions;

class TestReverse extends Test {
    public function new() {}

    function testEmpty() {
        var i = Extensions.reverse([]).iterator();
        Assert.isFalse(i.hasNext());
    }

    function testSingle() {
        var i = Extensions.reverse([1]).iterator();
        Assert.isTrue(i.hasNext());
        Assert.isTrue(i.next() == 1);
        Assert.isFalse(i.hasNext());
    }

    function testMany() {
        var i = Extensions.reverse([1, 2, 3]).iterator();
        Assert.isTrue(i.hasNext());
        Assert.isTrue(i.next() == 3);
        Assert.isTrue(i.hasNext());
        Assert.isTrue(i.next() == 2);
        Assert.isTrue(i.hasNext());
        Assert.isTrue(i.next() == 1);
        Assert.isFalse(i.hasNext());
    }
}
