package cases;

import utest.Assert;
using itertools.Extensions;

class TestAll extends Test {
	public function new() {}

	function testEmpty() {
		var r = [].iterator().all(x -> x % 2 == 0);
		Assert.isTrue(r);
	}

	function testSingleTrue() {
		var r = [2].iterator().all(x -> x % 2 == 0);
		Assert.isTrue(r);
	}

	function testSingleFalse() {
		var r = [1].iterator().all(x -> x % 2 == 0);
		Assert.isFalse(r);
	}

	function testManyTrue() {
		var r = [2, 6, 4, 0].iterator().all(x -> x % 2 == 0);
		Assert.isTrue(r);
	}

	function testManyFalse() {
		var r = [2, 6, 4, 3, 0].iterator().all(x -> x % 2 == 0);
		Assert.isFalse(r);
	}
}
