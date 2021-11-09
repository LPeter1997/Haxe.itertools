package cases;

import utest.Assert;
using itertools.Extensions;

class TestJoin extends Test {
    public function new() {}

    function testEmpty() {
        var r = Extensions.join([], ", ");
        Assert.isTrue(r == "");
    }

    function testSingle() {
        var r = Extensions.join([1], ", ");
        Assert.isTrue(r == "1");
    }

    function testMany() {
        var r = Extensions.join([1, 2, 3], ", ");
        Assert.isTrue(r == "1, 2, 3");
    }
}
