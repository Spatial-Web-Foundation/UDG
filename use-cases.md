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

#### Observations


