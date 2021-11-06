package cases;

import utest.Assert;
using itertools.Extensions;

class TestScanl extends Test {
	public function new() {}

    function testEmpty() {
		var r = [].iterator().scanl(0, (x, y) -> x + y);
		Assert.isTrue(r.hasNext());
		Assert.isTrue(r.next() == 0);
        Assert.isFalse(r.hasNext());
	}

	function testSum() {
		var r = [1, 2, 3, 4].iterator().scanl(0, (x, y) -> x + y);
		Assert.isTrue(r.next() == 0);
		Assert.isTrue(r.next() == 1);
		Assert.isTrue(r.next() == 3);
		Assert.isTrue(r.next() == 6);
		Assert.isTrue(r.next() == 10);
        Assert.isFalse(r.hasNext());
	}
}
