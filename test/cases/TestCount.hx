package cases;

import utest.Assert;
using itertools.Extensions;

class TestCount extends Test {
    public function new() {}

    function testEmpty() {
        var c = [].count();
        Assert.isTrue(c == 0);
    }

    function testSingle() {
        var c = [1].count();
        Assert.isTrue(c == 1);
    }

    function testMany() {
        var c = [1, 2, 3, 4, 5].count();
        Assert.isTrue(c == 5);
    }
}
