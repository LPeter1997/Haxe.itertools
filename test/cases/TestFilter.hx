package cases;

import utest.Assert;
using itertools.Extensions;

class TestFilter extends Test {
    public function new() {}

    function testEmpty() {
        var f = [].asIterable().filter(x -> x % 2 == 0).iterator();
        Assert.isFalse(f.hasNext());
    }

    function testNoMatch() {
        var f = [1, 3, 5].asIterable().filter(x -> x % 2 == 0).iterator();
        Assert.isFalse(f.hasNext());
    }

    function testOneMatch() {
        var f = [1, 3, 2, 5].asIterable().filter(x -> x % 2 == 0).iterator();
        Assert.isTrue(f.hasNext());
        Assert.isTrue(f.next() == 2);
        Assert.isFalse(f.hasNext());
    }

    function testManyMatches() {
        var f = [1, 3, 2, 5, 4, 9, 6].asIterable().filter(x -> x % 2 == 0).iterator();
        Assert.isTrue(f.hasNext());
        Assert.isTrue(f.next() == 2);
        Assert.isTrue(f.hasNext());
        Assert.isTrue(f.next() == 4);
        Assert.isTrue(f.hasNext());
        Assert.isTrue(f.next() == 6);
        Assert.isFalse(f.hasNext());
    }
}
