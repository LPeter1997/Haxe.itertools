package cases;

import utest.Assert;
using itertools.Extensions;

class TestSkip extends Test {
    public function new() {}

    function testEmptySkip0() {
        var i = [].iterator().skip(0);
        Assert.isFalse(i.hasNext());
    }

    function testSingleSkip1() {
        var i = [1].iterator().skip(1);
        Assert.isFalse(i.hasNext());
    }

    function testNotEmptySkipAll() {
        var i = [1, 2, 3].iterator().skip(3);
        Assert.isFalse(i.hasNext());
    }

    function testNotEmptySkip1() {
        var i = [1, 2, 3].iterator().skip(1);
        Assert.isTrue(i.hasNext());
        Assert.isTrue(i.next() == 2);
        Assert.isTrue(i.hasNext());
        Assert.isTrue(i.next() == 3);
        Assert.isFalse(i.hasNext());
    }

    function testNotEmptySkip2() {
        var i = [1, 2, 3].iterator().skip(2);
        Assert.isTrue(i.hasNext());
        Assert.isTrue(i.next() == 3);
        Assert.isFalse(i.hasNext());
    }
}
