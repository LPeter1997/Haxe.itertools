package cases;

import utest.Assert;
using itertools.Extensions;

class TestLast extends Test {
    public function new() {}

    function testEmpty() {
        var f = [].iterator().last();
        Assert.isTrue(f.match(None));
    }

    function testSingle() {
        var f = [2].iterator().last();
        Assert.isTrue(f.match(Some(2)));
    }

    function testMany() {
        var f = [2, 3, 4].iterator().last();
        Assert.isTrue(f.match(Some(4)));
    }
}
