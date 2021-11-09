package cases;

import utest.Assert;
using itertools.Extensions;

class TestFlatten extends Test {
    public function new() {}

    function testAllEmpties() {
        var r = [[], [], []].flatten().iterator();
        Assert.isFalse(r.hasNext());
    }

    function testFirstNotEmpty() {
        var r = [[1, 2, 3], [], []].flatten().iterator();
        Assert.isTrue(r.hasNext());
        Assert.isTrue(r.next() == 1);
        Assert.isTrue(r.hasNext());
        Assert.isTrue(r.next() == 2);
        Assert.isTrue(r.hasNext());
        Assert.isTrue(r.next() == 3);
        Assert.isFalse(r.hasNext());
    }

    function testSecondNotEmpty() {
        var r = [[], [1, 2, 3], []].flatten().iterator();
        Assert.isTrue(r.hasNext());
        Assert.isTrue(r.next() == 1);
        Assert.isTrue(r.hasNext());
        Assert.isTrue(r.next() == 2);
        Assert.isTrue(r.hasNext());
        Assert.isTrue(r.next() == 3);
        Assert.isFalse(r.hasNext());
    }

    function testLastNotEmpty() {
        var r = [[], [], [1, 2, 3]].flatten().iterator();
        Assert.isTrue(r.hasNext());
        Assert.isTrue(r.next() == 1);
        Assert.isTrue(r.hasNext());
        Assert.isTrue(r.next() == 2);
        Assert.isTrue(r.hasNext());
        Assert.isTrue(r.next() == 3);
        Assert.isFalse(r.hasNext());
    }

    function testNotEmpty() {
        var r = [[1], [2], [3, 4]].flatten().iterator();
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
        var r = [[1, 2], [], [3, 4]].flatten().iterator();
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
        var r = [[1, 2], [], [], [3, 4]].flatten().iterator();
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
