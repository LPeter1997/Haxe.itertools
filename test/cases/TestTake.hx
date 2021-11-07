package cases;

import utest.Assert;
using itertools.Extensions;

class TestTake extends Test {
    public function new() {}

    function testEmptyTake0() {
        var i = [].iterator().take(0);
        Assert.isFalse(i.hasNext());
    }

    function testEmptyTake1() {
        var i = [].iterator().take(1);
        Assert.isFalse(i.hasNext());
    }

    function testSingleTake1() {
        var i = [1].iterator().take(1);
        Assert.isTrue(i.hasNext());
        Assert.isTrue(i.next() == 1);
        Assert.isFalse(i.hasNext());
    }

    function testSingleTakeMany() {
        var i = [1].iterator().take(10);
        Assert.isTrue(i.hasNext());
        Assert.isTrue(i.next() == 1);
        Assert.isFalse(i.hasNext());
    }

    function testNotEmptyTakeAll() {
        var i = [1, 2, 3].iterator().take(3);
        Assert.isTrue(i.hasNext());
        Assert.isTrue(i.next() == 1);
        Assert.isTrue(i.hasNext());
        Assert.isTrue(i.next() == 2);
        Assert.isTrue(i.hasNext());
        Assert.isTrue(i.next() == 3);
        Assert.isFalse(i.hasNext());
    }
}
