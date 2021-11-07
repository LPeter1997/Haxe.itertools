package cases;

import utest.Assert;
using itertools.Extensions;

class TestFlatten extends Test {
    public function new() {}

    function testAllEmpties() {
        var r = [[].iterator(), [].iterator(), [].iterator()].iterator().flatten();
        Assert.isFalse(r.hasNext());
    }

    function testFirstNotEmpty() {
        var r = [[1, 2, 3].iterator(), [].iterator(), [].iterator()].iterator().flatten();
        Assert.isTrue(r.hasNext());
        Assert.isTrue(r.next() == 1);
        Assert.isTrue(r.hasNext());
        Assert.isTrue(r.next() == 2);
        Assert.isTrue(r.hasNext());
        Assert.isTrue(r.next() == 3);
        Assert.isFalse(r.hasNext());
    }

    function testSecondNotEmpty() {
        var r = [[].iterator(), [1, 2, 3].iterator(), [].iterator()].iterator().flatten();
        Assert.isTrue(r.hasNext());
        Assert.isTrue(r.next() == 1);
        Assert.isTrue(r.hasNext());
        Assert.isTrue(r.next() == 2);
        Assert.isTrue(r.hasNext());
        Assert.isTrue(r.next() == 3);
        Assert.isFalse(r.hasNext());
    }

    function testLastNotEmpty() {
        var r = [[].iterator(), [].iterator(), [1, 2, 3].iterator()].iterator().flatten();
        Assert.isTrue(r.hasNext());
        Assert.isTrue(r.next() == 1);
        Assert.isTrue(r.hasNext());
        Assert.isTrue(r.next() == 2);
        Assert.isTrue(r.hasNext());
        Assert.isTrue(r.next() == 3);
        Assert.isFalse(r.hasNext());
    }

    function testNotEmpty() {
        var r = [[1].iterator(), [2].iterator(), [3, 4].iterator()].iterator().flatten();
        Assert.isTrue(r.hasNext());
        Assert.isTrue(r.next() == 1);
        Assert.isTrue(r.hasNext());
        Assert.isTrue(r.next() == 2);
        Assert.isTrue(r.hasNext());
        Assert.isTrue(r.next() == 3);
        Assert.isTrue(r.hasNext());
        Assert.isTrue(r.next() == 4);
        Assert.isFalse(r.hasNext());
    }

    function testNotEmptyWithGap() {
        var r = [[1, 2].iterator(), [].iterator(), [3, 4].iterator()].iterator().flatten();
        Assert.isTrue(r.hasNext());
        Assert.isTrue(r.next() == 1);
        Assert.isTrue(r.hasNext());
        Assert.isTrue(r.next() == 2);
        Assert.isTrue(r.hasNext());
        Assert.isTrue(r.next() == 3);
        Assert.isTrue(r.hasNext());
        Assert.isTrue(r.next() == 4);
        Assert.isFalse(r.hasNext());
    }

    function testNotEmptyWithGaps() {
        var r = [[1, 2].iterator(), [].iterator(), [].iterator(), [3, 4].iterator()].iterator().flatten();
        Assert.isTrue(r.hasNext());
        Assert.isTrue(r.next() == 1);
        Assert.isTrue(r.hasNext());
        Assert.isTrue(r.next() == 2);
        Assert.isTrue(r.hasNext());
        Assert.isTrue(r.next() == 3);
        Assert.isTrue(r.hasNext());
        Assert.isTrue(r.next() == 4);
        Assert.isFalse(r.hasNext());
    }
}
