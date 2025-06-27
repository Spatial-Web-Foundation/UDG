# Entities

An **entity** is the fundamental class within the UDG for describing the various things, agents, and places that make up the Spatial Web. Every structure, building, planet, character (agent), animal, mystical alien pyramid or similar construct, is ultimately an entity, and is addressable within the context of the spatial web.

An entity exists within the context of a [Domain](Domain.md), where a domain can be thought of as an area of concern in which things happen. While this may (and most likely will) be a physical construct, it doesn't necessarily have to be.

An entity is a spatial web representation of a thing. Internally this entity is represented as a graph of information that describes its identifier, changing in response to changes in its environment (the domain graph in which it resides, which is composed of the graphs of other entities in that system).

There are a specific set of attributes which are required for the entity. Specifically, an entity must have: 
* a __spatial web identifier__ or __SWID__, a form of decentralized identifier that can be used to identify the entity uniquely within the broader spatial web.
* A __domain type__, which indicates the particular role that the entity plays within the domain. This identifies how the entity is classified within the spatial web. Note that an entity can be defined by multiple different ontologies, but it _must_ have the domain type.

An entity may have other other attributes, but these are not required:
* A __location__, which identifies the entity's position in a state space (or __hyperspace__), relative to either the containing domain, or to an externally defined domain. If a domain exists solely as a vehicle for containment, then location is not specifically required, though it often contains additional state information that is not strictly speaking positional. 
* Zero or more __activities__, which provides the operational instructions for the entity in question. The structure of the activity is language independent and declarative.
* Zero or more __style__ resources, which provides a mechanism for rendering the entity with different content types. _Please note, this has not been formally proposed yet, and may be removed._
* Zero or one __link__ references to an external domain. Some entities provide a link that can be activated through certain interfaces or affordances. This is a simple link, meaning it changes the context (domain) of the agent initiating the link without specific constraints, which is analogous to an HTTP standard hyperlink. More information about links will be covered in the subsection [Links](Links.md).
