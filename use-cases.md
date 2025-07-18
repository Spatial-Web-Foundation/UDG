# Use Cases

## 5.3.5. Cultural Location Tourism

There are a number of different potential scenarios with the UDG for the D3.3.1 specification 5.3.5 The following breaks this down into more testable use cases.

### 5.3.5.1. A Virtual Tour

#### Scenario

Jane is interested in getting a virtual tour of the Smithsonian Institute's Natural History Museum (SI-NHM) through her laptop, in preparation for physically touring the museum. She goes to the SI-NHM's Tour Domain, looks at the map showing an exploded view of the museum, then clicks on the first exhibit she wants to see (the Gem Room), which then takes her to this room, where she can go from station to station (place to place). 

At each exhibit, she can see photographs, 3D renderings or movies showing the content, along with a detailed synopsis (card) of the exhibit's history. She can continue "walking" through the exhibits, walk to the next room, or can search to find exhibits on topics that she's interested in (which she can also bookmark). She can continue in this manner until she leaves. Once she's done, she can ask the spatial web server to calculate the best tour that she can take to hit the exhibits of most interest to her. As Jane moves through the museum, she can add comments (annotations) on each place that she's in. 

#### What Does This Test?

* Placement of agent within a domain
* Generation of a map
* Navigation within a domain
* Retrieval of Content Metadata
* Retrieval of Media
* Optimization of Paths
* Persistence of Domain Data
* Presentation through Devices (VR glasses or smart phones)

#### Requirements

* Each gallery within the museum can be modeled as a place.
* Each station within a gallery can also be modeled as a place within a holonic link to the associated gallery. 
* Each station in a gallery has a thing (a kiosk) which displays information about the station's topic. The information can either be stored within a <hsml:Content> node or can be referenced via an external API (same element, but with an external href). Syntax TBD.
* Each place has a link to each of its neighbors. These links are contextual (the agent's permissions may determine whether a link is visible or active, for instance).
* Motion is tracked via historical Events that get persisted when a particular place is visited or activity is undertaken.
* The Agent in this case represents the actor (Jane) within the context of the domain.
* Annotations can be bound to either the historical log or the place.
* The museum domain has a home place that would correspond to the entryway into the museum, and each gallery would have a home place that would indicate the first kiosk "seen" by the agent when entering the agent.
* The default map function on the museum domain would show each gallery, while the default map function on each gallery domain would show the kiosks within that gallery. 
* A map function can also pass a level of detail (LOD) parameter that would indication how many levels deep the map response whould discover. Thus, an LOD of 2 would show each gallery and each station in the gallery, along with all agents within the relevant domain at that level, depending upon agent access privileges.
* The data feeds for the kiosks are language sensitive. This means that the agent can set the language for output (or at least select from a list of available languages).

#### Observations

* The tour is one of the most prevalent paradigms of the spatial web. Almost every scenario involves either requesting a map, moving through that map via links, or interacting with a thing within that domain as part of that tour. 
* In this respect, you can think of one of the roles of an agent is to act as the focus of intent within a given domain. 
* This museum is a single agent instance of a SI-NHM museum domain template. It will stay active until either an end condition is met (even if that is simply terminating the instance). As such domains are kind of like virtual machines - they can be paused to retain their state, or they can be deleted when no longer needed.

### 5.3.5.2. An XR Experience

This is a similar scenario to 5.3.5.1, with the following differences:

#### Scenario

Jane goes to the museum, with her trusty VR glasses perched on her nose, synched to the museum's instance. As she enters the front entrance, the spatial web sensors correlate the position (via GPS or other positional sensor tech) to a given place, as defined by its H3 tile(s). If she is within the relevant tile, the spatial web glasses indicate that there is additional relevant metadata in the place, which can be activated to show the relevant media (videos, perhaps).

Jane summons up a map to see what is available, and starts to move, and as she leaves a given region and moves into another, the old billboard goes away to be replaced by a new map or billboard icon (possibly both) that can then be expanded.

At some point, she gets hungry, and wants to know how to get to the cafeteria. She asks for the cafeteria and either an arrow will pop up in front of her indicating the direction to follow or a map will appear with a path to that area. 

As she eats, Jane decides that she wants to go from a visual to a light visual + audio display. From then on, instead of billboards, a running commentary comes through her earbuds, with directions, recommendations, and warnings being spoken rather than displayed as imagery or text video.

At the end of her tour, she can ask for an itinerary and transcription, which reproduces critical information that can then be transmitted as compressed HSML and saved for later review.

#### What Does This Test?

* Everything in 5.3.5.1
* Geopositioning with external environment synching.
* Search
* Modalities of perception
* Path negotiation and optimization
* History and Transcription

#### Requirements

* Sensors within the client device can provide mapping to a spatial position, which can then be transformed into a tile position, correlating with a given place within the model. Note that if somehow the actor ends up outside of defined tiles, then an algorithm can be used to determine the closest place within the domain, which can be correlated to suggest directions. 
* Search is a query against places, things and agents respectively that will suggest candidates that most closely match the query parameters. This will generally be displayed as a list, and can be filtered by type. Search is sensitive to agent permissions.
* Modality may be a function of the client or the node, but will typically work by transforming a map in RDF into some other form (an image, a diagram, audio, a movie, 3d environment, etc.) that can be consequently rendered by the client. The exact mechanism for performing this is TBD. 
* As an agent moves through a domain, that agent creates a history correlated to the agent and the domain that can be persisted, then transformed into various forms, such as a transcript or summary.



