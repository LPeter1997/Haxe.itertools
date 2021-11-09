package cases;

import utest.Assert;
using itertools.Extensions;

class TestLast extends Test {
    public function new() {}

    function testEmpty() {
        var f = [].last();
        Assert.isTrue(f.match(None));
    }

    function testSingle() {
        var f = [2].last();
        Assert.isTrue(f.match(Some(2)));
    }

    function testMany() {
        var f = [2, 3, 4].last();
        Assert.isTrue(f.match(Some(4)));
    }
}
