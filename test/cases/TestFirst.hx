package cases;

import utest.Assert;
using itertools.Extensions;

class TestFirst extends Test {
    public function new() {}

    function testEmpty() {
        var f = [].first();
        Assert.isTrue(f.match(None));
    }

    function testSingle() {
        var f = [2].first();
        Assert.isTrue(f.match(Some(2)));
    }

    function testMany() {
        var f = [2, 3, 4].first();
        Assert.isTrue(f.match(Some(2)));
    }
}
