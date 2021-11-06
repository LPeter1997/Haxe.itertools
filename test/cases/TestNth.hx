package cases;

import utest.Assert;
using itertools.Extensions;

class TestNth extends Test {
	public function new() {}

	function testEmpty0th() {
		var f = [].iterator().nth(0);
        Assert.isTrue(f.match(None));
	}

    function testEmpty1st() {
		var f = [].iterator().nth(1);
        Assert.isTrue(f.match(None));
	}

    function testSingle0th() {
		var f = [1].iterator().nth(0);
        Assert.isTrue(f.match(Some(1)));
	}

    function testSingle1st() {
		var f = [1].iterator().nth(1);
        Assert.isTrue(f.match(None));
	}

    function testMany0th() {
		var f = [1, 2, 3].iterator().nth(0);
        Assert.isTrue(f.match(Some(1)));
	}

    function testMany1st() {
		var f = [1, 2, 3].iterator().nth(1);
        Assert.isTrue(f.match(Some(2)));
	}

    function testMany10th() {
		var f = [1, 2, 3].iterator().nth(10);
        Assert.isTrue(f.match(None));
	}
}
