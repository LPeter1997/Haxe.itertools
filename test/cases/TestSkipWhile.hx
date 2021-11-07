package cases;

import utest.Assert;
using itertools.Extensions;

class TestSkipWhile extends Test {
    public function new() {}

    function testEmpty() {
        var i = [].iterator().skipWhile(x -> x < 0);
        Assert.isFalse(i.hasNext());
    }

    function testSingleSkipped() {
        var i = [-1].iterator().skipWhile(x -> x < 0);
        Assert.isFalse(i.hasNext());
    }

    function testSingleNotSkipped() {
        var i = [1].iterator().skipWhile(x -> x < 0);
        Assert.isTrue(i.hasNext());
        Assert.isTrue(i.next() == 1);
        Assert.isFalse(i.hasNext());
    }

    function testOneSkipped() {
        var i = [-1, 1].iterator().skipWhile(x -> x < 0);
        Assert.isTrue(i.hasNext());
        Assert.isTrue(i.next() == 1);
        Assert.isFalse(i.hasNext());
    }

    function testManySkipped() {
        var i = [-1, -2, 1, 2, -3].iterator().skipWhile(x -> x < 0);
        Assert.isTrue(i.hasNext());
        Assert.isTrue(i.next() == 1);
        Assert.isTrue(i.hasNext());
        Assert.isTrue(i.next() == 2);
        Assert.isTrue(i.hasNext());
        Assert.isTrue(i.next() == -3);
        Assert.isFalse(i.hasNext());
    }
}
