# Boilerplate
p := $(p).x
dirstack_$(p) := $(d)
d := $(dir)

# Local rules and targets
ifndef CASSANDRA_VERSION
$(error CASSANDRA_VERSION is undefined)
endif

DOCKER_IMAGE_$(d) := b9company/cassandra
DOCKER_TAG_$(d) := $(CASSANDRA_VERSION)

BUILD := $(BUILD) build_$(d)
PUSH := $(PUSH) push_$(d)

build_$(d): DOCKER_IMAGE := $(DOCKER_IMAGE_$(d))
build_$(d): DOCKER_TAG := $(DOCKER_TAG_$(d))
build_$(d): DOCKER_CONTEXT := $(d)
build_$(d): CASSANDRA_MIRROR := http://apache.crihan.fr/dist/cassandra
build_$(d): $(d)/Dockerfile
	docker build \
		--build-arg CASSANDRA_VERSION="$(CASSANDRA_VERSION)" \
		--build-arg CASSANDRA_MIRROR="$(CASSANDRA_MIRROR)" \
		$(if $(CASSANDRA_ARCHIVE),--build-arg CASSANDRA_ARCHIVE="$(CASSANDRA_ARCHIVE)") \
		-t "$(DOCKER_IMAGE):$(DOCKER_TAG)" "$(DOCKER_CONTEXT)"

push_$(d): DOCKER_IMAGE := $(DOCKER_IMAGE_$(d))
push_$(d): DOCKER_TAG := $(DOCKER_TAG_$(d))
push_$(d):
	docker push "$(DOCKER_IMAGE):$(DOCKER_TAG)"

# Boilerplate
d := $(dirstack_$(p))
p := $(basename $(p))
