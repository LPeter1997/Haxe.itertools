package cases;

import utest.Assert;
using itertools.Extensions;

class TestToArray extends Test {
	public function new() {}

	function testEmpty() {
		var i = [].iterator().toArray();
        Assert.isTrue(i.length == 0);
	}

    function testNotEmpty() {
		var i = [1, 2, 3].iterator().toArray();
        Assert.isTrue(i.length == 3);
        Assert.isTrue(i[0] == 1);
        Assert.isTrue(i[1] == 2);
        Assert.isTrue(i[2] == 3);
	}
}
