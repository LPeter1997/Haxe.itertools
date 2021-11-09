package cases;

import utest.Assert;
using itertools.Extensions;

class TestTakeWhile extends Test {
    public function new() {}

    function testEmpty() {
        var i = [].takeWhile(x -> x < 0).iterator();
        Assert.isFalse(i.hasNext());
    }

    function testSingleTaken() {
        var i = [-1].takeWhile(x -> x < 0).iterator();
        Assert.isTrue(i.hasNext());
        Assert.isTrue(i.next() == -1);
        Assert.isFalse(i.hasNext());
    }

    function testSingleSkipped() {
        var i = [1].takeWhile(x -> x < 0).iterator();
        Assert.isFalse(i.hasNext());
    }

    function testOneTaken() {
        var i = [-1, 1].takeWhile(x -> x < 0).iterator();
        Assert.isTrue(i.hasNext());
        Assert.isTrue(i.next() == -1);
        Assert.isFalse(i.hasNext());
    }

    function testManyTaken() {
        var i = [-1, -2, 1, 2, -3].takeWhile(x -> x < 0).iterator();
        Assert.isTrue(i.hasNext());
        Assert.isTrue(i.next() == -1);
        Assert.isTrue(i.hasNext());
        Assert.isTrue(i.next() == -2);
        Assert.isFalse(i.hasNext());
    }
}
