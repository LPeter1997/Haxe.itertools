package cases;

import utest.Assert;
using itertools.Extensions;

class TestJoin extends Test {
    public function new() {}

    function testEmpty() {
        var r = [].iterator().join(", ");
        Assert.isTrue(r == "");
    }

    function testSingle() {
        var r = [1].iterator().join(", ");
        Assert.isTrue(r == "1");
    }

    function testMany() {
        var r = [1, 2, 3].iterator().join(", ");
        Assert.isTrue(r == "1, 2, 3");
    }
}
