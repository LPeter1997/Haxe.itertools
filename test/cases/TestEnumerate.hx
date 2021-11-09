package cases;

import utest.Assert;
using itertools.Extensions;

class TestEnumerate extends Test {
    public function new() {}

    function testEmpty() {
        var i = [].enumerate().iterator();
        Assert.isFalse(i.hasNext());
    }

    function testMany() {
        var i = ["x", "y", "z"].enumerate().iterator();
        Assert.isTrue(i.hasNext());
        Assert.isTrue(switch (i.next()) { case {index: 0, item:"x"}: true; case _: false; });
        Assert.isTrue(i.hasNext());
        Assert.isTrue(switch (i.next()) { case {index: 1, item:"y"}: true; case _: false; });
        Assert.isTrue(i.hasNext());
        Assert.isTrue(switch (i.next()) { case {index: 2, item:"z"}: true; case _: false; });
        Assert.isFalse(i.hasNext());
    }
}
