package cases;

import utest.Assert;
using itertools.Extensions;

class TestAny extends Test {
    public function new() {}

    function testEmpty() {
        var r = [].any(x -> x % 2 == 0);
        Assert.isFalse(r);
    }

    function testSingleTrue() {
        var r = [2].any(x -> x % 2 == 0);
        Assert.isTrue(r);
    }

    function testSingleFalse() {
        var r = [1].any(x -> x % 2 == 0);
        Assert.isFalse(r);
    }

    function testManyTrue() {
        var r = [1, 3, 4, 5].any(x -> x % 2 == 0);
        Assert.isTrue(r);
    }

    function testManyFalse() {
        var r = [1, 7, 5, 3, 1].any(x -> x % 2 == 0);
        Assert.isFalse(r);
    }
}
