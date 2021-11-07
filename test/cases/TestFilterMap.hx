package cases;

import utest.Assert;
using itertools.Extensions;

class TestFilterMap extends Test {
    public function new() {}

    function testEmpty() {
        var f = [].iterator().filterMap(x -> if (x % 2 == 0) Some(x * 2) else None);
        Assert.isFalse(f.hasNext());
    }

    function testNoMatch() {
        var f = [1, 3, 5].iterator().filterMap(x -> if (x % 2 == 0) Some(x * 2) else None);
        Assert.isFalse(f.hasNext());
    }

    function testOneMatch() {
        var f = [1, 3, 2, 5].iterator().filterMap(x -> if (x % 2 == 0) Some(x * 2) else None);
        Assert.isTrue(f.hasNext());
        Assert.isTrue(f.next() == 4);
        Assert.isFalse(f.hasNext());
    }

    function testManyMatches() {
        var f = [1, 3, 2, 5, 4, 9, 6].iterator().filterMap(x -> if (x % 2 == 0) Some(x * 2) else None);
        Assert.isTrue(f.hasNext());
        Assert.isTrue(f.next() == 4);
        Assert.isTrue(f.hasNext());
        Assert.isTrue(f.next() == 8);
        Assert.isTrue(f.hasNext());
        Assert.isTrue(f.next() == 12);
        Assert.isFalse(f.hasNext());
    }
}
