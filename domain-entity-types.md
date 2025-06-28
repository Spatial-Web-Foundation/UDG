# Domain Entity Types

A __domain entity type__ is a specialization of an entity that incorporates additional capabilities. Within the Spatial Web, these extensions are defined using the Shape Constraint Language (SHACL), as a generalized schema language, with the mechanism for such extension covered in the section [Domain Entity Type Extensions](domain-entity-types.md), with link TBD.

Currently several core extensions are defined: Place, Link, Domain, Sensor, Thing, Agent, and Assemblages, with others derivable from these. These are differentiated as follows:

* A __place__ is defined roughly as a specific addressable location within a domain. Places define where an entity can be, and where they can't. Cf [Places](places.md) for more information.

* A __link__ is a mechanism for navigating between both places (internal links) and domains (external links). It is the analog of a hypertext link in the HTTP world.Cf. [Links](links.md) for more information.

* A __domain__ is a system of concern, and is effectively the partition of a given universe into a navigable area. Domains are where things happen. Cf [Domains](domains.md).

* A __sensor__ is an abstraction of a camera, recording device, eyeball, etc. Its purpose is to provide a reference point of view for an entity within a domain (or of the domain itself).  Cf. [Sensors](sensors.md) for more information.

* A __thing__ is defined as an entity that is directed by the system (the local spatial web daemon). Not that directed here means simply that it provides the motivating influence on the thing, not that it determines a things exact behaviors. In effect, both things and agents are "semi-autonomous" in that they have some (perhaps minimal) self-control, but they respond to outside influences. Things can be considered non-player characters, but they can also be structures, vehicles, animals, portals, and so forth. Cf. [Things](#things) for more details.

* An __agent__ is defined as an entity that is directable by an outside (out of system) actor. Agents generally act as the eyes, ears, hands, and feet of the actor. It corresponds roughly to a character in a novel, play, or game, but in a more generalized fashion. Cf. [Agents](#agents) for more details.

* An __assemblage__ is an aggregate structure of things, places, and agents. It is intended to model corporations, institutions, governments, and so forth, but it can also model physical or other composite structures.  Cf. [Assemblages](#assemblages) for more information. 

[[Previous]](entities.md) [[Next]](places.md)