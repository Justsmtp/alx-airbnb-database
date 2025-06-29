<?xml version="1.0" encoding="UTF-8"?>
<mxfile host="app.diagrams.net">
  <diagram id="ERDiagram" name="ER Diagram">
    <mxGraphModel dx="962" dy="523" grid="1" gridSize="10" guides="1">
      <root>
        <mxCell id="0"/>
        <mxCell id="1" parent="0"/>

        <!-- User -->
        <mxCell id="2" value="User&#xa;-----------&#xa;user_id (PK)&#xa;name&#xa;email&#xa;password&#xa;phone&#xa;created_at" style="shape=swimlane;whiteSpace=wrap;html=1;" vertex="1" parent="1">
          <mxGeometry x="20" y="20" width="160" height="160" as="geometry"/>
        </mxCell>

        <!-- Property -->
        <mxCell id="3" value="Property&#xa;---------------&#xa;property_id (PK)&#xa;owner_id (FK)&#xa;title&#xa;description&#xa;address&#xa;price_per_night&#xa;created_at" style="shape=swimlane;whiteSpace=wrap;html=1;" vertex="1" parent="1">
          <mxGeometry x="220" y="20" width="200" height="180" as="geometry"/>
        </mxCell>

        <!-- Booking -->
        <mxCell id="4" value="Booking&#xa;-------------&#xa;booking_id (PK)&#xa;user_id (FK)&#xa;property_id (FK)&#xa;start_date&#xa;end_date&#xa;total_price&#xa;status" style="shape=swimlane;whiteSpace=wrap;html=1;" vertex="1" parent="1">
          <mxGeometry x="20" y="240" width="180" height="160" as="geometry"/>
        </mxCell>

        <!-- Review -->
        <mxCell id="5" value="Review&#xa;------------&#xa;review_id (PK)&#xa;user_id (FK)&#xa;property_id (FK)&#xa;rating&#xa;comment&#xa;created_at" style="shape=swimlane;whiteSpace=wrap;html=1;" vertex="1" parent="1">
          <mxGeometry x="450" y="20" width="180" height="160" as="geometry"/>
        </mxCell>

        <!-- Payment -->
        <mxCell id="6" value="Payment&#xa;--------------&#xa;payment_id (PK)&#xa;booking_id (FK)&#xa;amount&#xa;payment_date&#xa;payment_method&#xa;status" style="shape=swimlane;whiteSpace=wrap;html=1;" vertex="1" parent="1">
          <mxGeometry x="250" y="250" width="180" height="160" as="geometry"/>
        </mxCell>

        <!-- Relationships -->
        <mxCell id="7" style="edgeStyle=orthogonalEdgeStyle;endArrow=block;html=1;" edge="1" parent="1" source="2" target="4">
          <mxGeometry relative="1" as="geometry"/>
        </mxCell>
        <mxCell id="8" style="edgeStyle=orthogonalEdgeStyle;endArrow=block;html=1;" edge="1" parent="1" source="2" target="3">
          <mxGeometry relative="1" as="geometry"/>
        </mxCell>
        <mxCell id="9" style="edgeStyle=orthogonalEdgeStyle;endArrow=block;html=1;" edge="1" parent="1" source="3" target="4">
          <mxGeometry relative="1" as="geometry"/>
        </mxCell>
        <mxCell id="10" style="edgeStyle=orthogonalEdgeStyle;endArrow=block;html=1;" edge="1" parent="1" source="2" target="5">
          <mxGeometry relative="1" as="geometry"/>
        </mxCell>
        <mxCell id="11" style="edgeStyle=orthogonalEdgeStyle;endArrow=block;html=1;" edge="1" parent="1" source="3" target="5">
          <mxGeometry relative="1" as="geometry"/>
        </mxCell>
        <mxCell id="12" style="edgeStyle=orthogonalEdgeStyle;endArrow=block;html=1;" edge="1" parent="1" source="4" target="6">
          <mxGeometry relative="1" as="geometry"/>
        </mxCell>
      </root>
    </mxGraphModel>
  </diagram>
</mxfile>
