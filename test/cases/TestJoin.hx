package cases;

import utest.Assert;
using itertools.Extensions;

class TestJoin extends Test {
    public function new() {}

    function testEmpty() {
        var r = [].asIterable().join(", ");
        Assert.isTrue(r == "");
    }

    function testSingle() {
        var r = [1].asIterable().join(", ");
        Assert.isTrue(r == "1");
    }

    function testMany() {
        var r = [1, 2, 3].asIterable().join(", ");
        Assert.isTrue(r == "1, 2, 3");
    }
}
