# Domains and Contexts
 
## Definition of A Domain

> __Definition.__ A domain is an object that identifies a context for an activity for or by a given agent at a specific place acting upon various things within that domain. Everything that happens within the UDG happens within a domain.

A domain is a _system_. The domain provides the answers to a number of key questions about the system in question.
* __Where?__. Where (what place) does the action within the system take place? 
* __How Is Space Defined?__ What are the relevant places of relevance within the system (it's hyperspace).
* __How Is Spae Connected?__. How are things within the domain connected, and how are domains connected to other domains?
* __What Happened?__. Is it possible to retrieve a history of what happened within the domain over time?  
* __What Kind?__. What classifications apply to the domain?   
* __Who?__. Which agents are participating within the domain?
* __When?__. When does the activity take place within the context of the domain. This becomes especially critical for asynchronous events.
* __What Happened?__. Is it possible to retrieve a history of what happened within the domain over time?  
* __How?__. What are the activities that can be accomplished within the domain, and how are these activated?
* __Why?__. What are the goals or purposes of the domain, and what happens when those goals are achieved?



Domains, unlike entities, are quasi-ephemeral. They exist within time (and by definition, space) but usually have a specific start time (or other condition) and end time (or other condition). Some domains may be fairly long-lasting, like a multiagent RPG that spans a number of different environments, while others may exist only for a session (or may be spun up or spun down, discussed below.

In general, a domain has a schematic representation that can be extended from a core domain type. This identifies the relevant state variables and properties for the domains beyond the properties of the Domain base class. Domains are entities in that they have swids, but they are in effect system (or holonic) entities.

## Use Case: The Light Bulb Room

> __Use Case.__ This is perhaps the simplest example of a domain. The Light Bulb room is a room with a single switch. The switch can be on or off. When the switch is on, the light is on. When the switch is off, the light is off.

### Where
 The domain is in a __Place__ that we can call `Light Bulb Room #1`. Note that for the Domain, there was a template (or base class) called `<Light Bulb Room>`, specified via a schema language (for the moment, SHACL), that can both be used to create multiple instances, and to limit the number of instances so created. 

This handles the particular situation in which a given instance is tied to a digital twin as well as the situation where a single long-running domain may exist. For the light bulb room class (LBR), if the instance was tied to a physical room, then LBR#1 would need to persist between sessions, which would mean that the SWID for the room would be persistent for all agents that had permissions to access the domain.

Note that Place in this case need only be a single value - the Room itself. The domain is the conceptual room, and there is no real reason to subdivide it into component places in this very simple model.

### How Is Space Defined

The operational definition of a hyperspace is the set of all valid places within a domain. The spatial web (as currently defined) is a discrete spatial system. What this means in practice is that things are located in specific discrete Places, and within a domain, an agent moves from one such discrete Place to another through a link. A Place can describe the specific extent in other terms (H3, Geometric Tiles, ESRI geometries andso forth) but the domain determines which of those places are considered valid. This in turn reduces a potentially intractable geometric description into a graph-oriented topological description.  

### How Is Space Connected

In a __domain__, two or more __places__ are connected by __links__. A link is analogous to a hypertext link in HTTP. In each domain, there is typically at least one link from a source place to the __home place__ of the domain. When you "go to" a domain, you're agent is actually moving to the home place for that domain, unless another place is explicitly stated. 

In the Light Bulb Room, there is only one place defined for that domain, so if you are coming from the directory domain for the SW Node, then the directory will contain a link to the LBR#1 place. Unless there is a conditional lock on the link (you have to satisfy a test condition), you (or more specifically your agent) can generatlly backtrack across links through the client 

### What

This indicates the things that are bound to the room that are controllable from within the domain. In this case, there are two distinct things - a light switch and a lamp. By activating the light switch, you enable the lamp. By deactivating the light switch, you disable the lamp. In an analog system, of course, what the light switch does is turn power off to an electrical outlet, but this is an operational detail that is unimportant to the model.

Note that there are a number of low level Things that will be generally subclassed. For instance, a lamp is a Meter that can take a value from a range of values (here [0,1]) A Toggle is a Thing that can take a Boolean value, and switch from one value to the other when activated. In short, many of these have a direct correspondance to HTML form components. These are detailed as part of the Activity specification, which is out of scope for this specification.

### What Kind

A domain can be classified based upon a conceptual facet value tied to a specific classication facet (known as the Domain taxonomy). The specific facet can be given as a subproperty of this depending on the definition given within the associated shape.

Everything is shape based rather than class based. This means that you can use combinations of facets to determine which property shapes apply to a given entity, which in turn means that you are not as dependent upon RDFS based supclass/subproperty inheritance.

In the case of the Light Room #1,onw such classification might be IoTDevice, while another may be Purpose:Illumination or something similar. 

### Who

This indicates the agent(s) that are currently within the context of the room. There may be zero or more agents in the room at any given point, though the domain model could be set up to limit the number of agents that can occupy a given place at a certain time. This creates a crude physics.

Note that in this model as well, there is no indication about the agents are, or what priorities they have. In general, if one agent turns the light on and the other turns it off, then the system will reflect the current state from the last activity that occurred.

Agents can move from one place to another (see [Places](places.md) for more information). 

### When

Each domain has a clock. Typically, such clocks can be defined in terms of a Spatial Web Node chronometer that is specific to the host (to the extent that in many cases, the domain can refer to a specific "System Clock", which is the default chronometer when not otherwise supplied). Note that this is used primarily to control timing and action within system on the part of autonomous entities, and in general is NOT synched from one node to the next. A chronometer is of type Entity:Thing.

Also please note that the chronometer is not technically part of hyperspace. If, for instance, you had a relativity simulation, then the time component of such a transformation would be treated as a coordinate in the hyperspace system (if you are doing Lorenz Transformations, for instance), but this is only peripherally related to the domain chronometer. The chronometer is, however, a key part of maintaining a domain history (see [What Happened?](#whatHappened). 

### What Happened

Each domain manages its own queue indicating relevant state change reports that are updated as part of the activity. This becomes the history of the domain. In this case, every time that the switch is flipped, the context of the domain for those things maintaining a history get written to the queue, indicating who initiated the action and what the state of the light (the meter) was at the time. This effectively creates a recording of the session, and in theory should be transformable to reproduce the state transitions of the system. 

> __Editor's Note__. The depth of the queue will obviously be dependent upon system resources, and may be in a condensed serialized format. The exact mechanism for how this works is still TBD.

### How

One of the roles of the chronometer is to indicate when a given domain should check to see if an expressed contextual configuration is in place (typically by querying the graph) and if it is, to then cause some activity within the domain. These are domain specific, such as expressing representations of the domain to an external channel.

> __Editor's Note__: The details of Activity are still being worked out, and will be updated accordingly here.

### Why

Most domains have objectives and goals. A remote drone domain, for instance, exists to get the drone to a target, perform a function, and hopefully return safely. These objectives typically will put the domain into a different state (Reset, Archive, Delete, etc.) In a game, these are the conditions that end the game and determine the winner. In a story, this is The End. In a device controller, this the termination of the updates to the devices in question. When the domain is instantiated, the why is set up as an end condition and is evaluated as part of the processing cycle for the domain. 

## Domains, Links and Holonics

Places have an obvious containment relationship - Earth is made up of continents, which are made up of ountries, which are made up of cities, which are made up of even smaller divisions.

Domains are not places, though they might appear to be at first glance. A domain has a place property that can in fact refer to multiple places. For instance, one can make up a domain of Red States, a domain of Blue States, and possible a domain of Purple States in the United States. It also has a Home place property that acts as a default when the domain is referenced as the target of a link.
