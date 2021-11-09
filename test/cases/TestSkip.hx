package cases;

import utest.Assert;
using itertools.Extensions;

class TestSkip extends Test {
    public function new() {}

    function testEmptySkip0() {
        var i = [].skip(0).iterator();
        Assert.isFalse(i.hasNext());
    }

    function testSingleSkip1() {
        var i = [1].skip(1).iterator();
        Assert.isFalse(i.hasNext());
    }

    function testNotEmptySkipAll() {
        var i = [1, 2, 3].skip(3).iterator();
        Assert.isFalse(i.hasNext());
    }

    function testNotEmptySkip1() {
        var i = [1, 2, 3].skip(1).iterator();
        Assert.isTrue(i.hasNext());
        Assert.isTrue(i.next() == 2);
        Assert.isTrue(i.hasNext());
        Assert.isTrue(i.next() == 3);
        Assert.isFalse(i.hasNext());
    }

    function testNotEmptySkip2() {
        var i = [1, 2, 3].skip(2).iterator();
        Assert.isTrue(i.hasNext());
        Assert.isTrue(i.next() == 3);
        Assert.isFalse(i.hasNext());
    }
}
