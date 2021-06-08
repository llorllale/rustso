#
# Copyright 2021 George Aristy.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

all: lint test

lint:
	@echo "linting..."
	@echo "... format"
	@cargo fmt
	@echo "... license headers"
	@docker run -v $(shell pwd):/src licenseweasel/weasel:v0.4 /src
	@echo "... clippy"
	@cargo clippy
	@echo "... puzzles"
	@docker run -v $(shell pwd):/src llorllale/pdd-docker:0.20.6 -q -f=puzzles.xml

test:
	@echo "testing..."
	@cargo test
